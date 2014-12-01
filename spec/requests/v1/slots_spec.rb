require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /v1/slots/:id" do
    let(:slot) { create(:meta_slot) }

    context "with valid ID" do
      it "returns success" do
        get "/v1/slots/#{slot.id}"
        expect(response).to have_http_status(200)
      end

      it "returns details of slot with given id" do
        get "/v1/slots/#{slot.id}"
        expect(json).to have_key('id')
        expect(json).to have_key('title')
        expect(json).to have_key('startdate')
        expect(json).to have_key('enddate')
        # expect(json).to have_key('note')
        # expect(json).to have_key('visibility')
        expect(json).to have_key('createdAt')
        expect(json).to have_key('updatedAt')
      end

      it "does return the correct attributes" do
        get "/v1/slots/#{slot.id}"
        expect(json['id']).to eq(slot.id)
        expect(json['title']).to eq(slot.title)
        expect(json['startdate']).to eq(slot.startdate.iso8601)
        expect(json['enddate']).to eq(slot.enddate.iso8601)
        # expect(json['note']).to eq(slot.note)
        # expect(json['visibility']).to eq(slot.visibility)
      end

      it "does return the slot title" do
        slot = create(:meta_slot, title: "Expected title")
        get "/v1/slots/#{slot.id}"
        expect(json['title']).to eq("Expected title")
      end
    end

    context "with invalid ID" do
      it "returns not found" do
        wrong_id = slot.id + 1
        get "/v1/slots/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "PATCH /v1/slots/:id" do
    let(:slot) { create(:meta_slot) }

    xdescribe "handling media items" do
      let!(:slot) { create(:meta_slot) }
      let(:add_media_item) { { new_media: media } }

      context "add images with valid params" do
        let(:media) do
          { media_type: "image",
            public_id: "foo-image",
            ordering: "1" }
        end

        it "returns success" do
          patch "/v1/slots/#{slot.id}", add_media_item
          expect(response).to have_http_status(:created)
        end

        it "returns a media_item_id" do
          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(json).to have_key('media_item_id')
        end

        it "returns the ID of new media_item" do
          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(json['media_item_id']).to eq(slot.media_items[0].id)
        end

        it "adds a new image" do
          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(slot.media_items.size).to eq(1)
        end

        it "adds the submitted image to the db" do
          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(slot.media_items[0].media_type).to eq(media[:media_type])
          expect(slot.media_items[0].public_id).to eq(media[:public_id])
          expect(slot.media_items[0].ordering).to eq(media[:ordering].to_i)
        end

        it "adds an additional new image" do
          create(:slot_image, mediable: slot, ordering: 0)

          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(slot.media_items.size).to eq(2)
        end

        it "adds a 2nd  submitted image to the db" do
          create(:slot_image, mediable: slot, ordering: 0)

          patch "/v1/slots/#{slot.id}", add_media_item
          new_media_item = MediaItem.last
          expect(new_media_item.media_type).to eq(media[:media_type])
          expect(new_media_item.public_id).to eq(media[:public_id])
          expect(new_media_item.ordering).to eq(media[:ordering].to_i)
        end

        context "missing ordering parameter" do
          let(:media) do
            { media_type: "image",
              public_id: "foo-image" }
          end

          it "adds it" do
            create(:slot_image, mediable: slot, ordering: 0)
            new_ordering = slot.media_items.size
            patch "/v1/slots/#{slot.id}", add_media_item

            expect(response).to have_http_status(:created)
            new_media_item = MediaItem.last
            expect(new_media_item.ordering).to eq(new_ordering)
          end
        end

        context "existing ordering parameter" do
          let(:media) do
            { media_type: "image",
              public_id: "foo-image",
              ordering: "0" }
          end

          it "updates existing ordering" do
            existing_1 = create(:slot_image, mediable: slot, ordering: 0)
            existing_2 = create(:slot_image, mediable: slot, ordering: 1)

            patch "/v1/slots/#{slot.id}", add_media_item

            expect(response).to have_http_status(:created)
            slot.reload
            existing_1.reload
            existing_2.reload

            expect(existing_1.ordering).to eq 1
            expect(existing_2.ordering).to eq 2
            expect(slot.media_items.last.ordering).to eq media[:ordering].to_i
          end
        end
      end

      context "add images with invalid params" do
        let(:media) do
          { media_type: "image",
            ordering: "0" }
        end

        it "returns 422 if public_id is missing" do
          patch "/v1/slots/#{slot.id}", add_media_item
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "returns the error" do
          patch "/v1/slots/#{slot.id}", add_media_item
          expect(response.body).to include 'public_id'
          expect(response.body).to include 'blank'
        end
      end

      describe "reorder images" do
        let!(:media_item_1) { create(:slot_image, mediable: slot, ordering: 0) }
        let!(:media_item_2) { create(:slot_image, mediable: slot, ordering: 1) }
        let!(:media_item_3) { create(:slot_image, mediable: slot, ordering: 2) }

        context "with valid params" do
          let(:media_reordering) do
            { media_type: "image",
              ordering_media: [
                { media_item_id: media_item_1.id,
                  ordering: 2 },
                { media_item_id: media_item_2.id,
                  ordering: 0 },
                { media_item_id: media_item_3.id,
                  ordering: 1 }
              ] }
          end

          it "returns success" do
            patch "/v1/slots/#{slot.id}", media_reordering
            expect(response).to have_http_status(:ok)
          end

          it "reorders media items" do
            patch "/v1/slots/#{slot.id}", media_reordering
            slot.reload
            expect(slot.media_items.find(media_item_1.id).ordering).to eq(2)
            expect(slot.media_items.find(media_item_2.id).ordering).to eq(0)
            expect(slot.media_items.find(media_item_3.id).ordering).to eq(1)
          end
        end

        context "with invalid params" do
          describe "media_item_id" do
            let(:invalid_id) { media_item_3.id + 1 }
            let(:media_reordering) do
              { media_type: "image",
                ordering_media: [
                  { media_item_id: media_item_1.id,
                    ordering: 2 },
                  { media_item_id: media_item_2.id,
                    ordering: 0 },
                  { media_item_id: invalid_id,
                    ordering: 1 }
                ] }
            end

            it "returns 404" do
              patch "/v1/slots/#{slot.id}", media_reordering
              slot.reload
              expect(response).to have_http_status(:not_found)
            end
          end

          describe "ordering" do
            let(:media_reordering) do
              { media_type: "image",
                ordering_media: [
                  { media_item_id: media_item_1.id,
                    ordering: 1 },
                  { media_item_id: media_item_2.id,
                    ordering: 0 },
                  { media_item_id: media_item_3.id,
                    ordering: 1 }
                ] }
            end

            it "returns 422" do
              patch "/v1/slots/#{slot.id}", media_reordering
              slot.reload
              expect(response).to have_http_status(:unprocessable_entity)
            end

            it "returns duplicate ordering numbers" do
              skip "TODO change handling of errors"
              patch "/v1/slots/#{slot.id}", media_reordering
              expect(json).to have_key('duplicate_ordering')
              expect(json['duplicate_ordering']).to eq [1]
            end
          end
        end
      end

      context "video" do
        let(:media) do
          { media_type: "video",
            public_id: "foo-video",
            ordering: "1" }
        end

        it "adds a new video" do
          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(slot.media_items[0].media_type).to eq(media[:media_type])
        end
      end

      context "voice" do
        let(:media) do
          { media_type: "voice",
            public_id: "foo-voice",
            ordering: "1" }
        end

        it "adds a new voice item" do
          patch "/v1/slots/#{slot.id}", add_media_item
          slot.reload
          expect(slot.media_items[0].media_type).to eq(media[:media_type])
        end
      end
    end
  end
end
