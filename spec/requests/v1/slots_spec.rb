require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:slot) { create(:slot) }

  describe "GET /v1/slots/:id" do
    context "with valid ID" do
      it "returns success" do
        get "/v1/slots/#{slot.id}"
        expect(response).to have_http_status(200)
      end

      it "returns details of slot with given id" do
        get "/v1/slots/#{slot.id}"
        json = JSON.parse(response.body)
        expect(json).to have_key('id')
        expect(json).to have_key('title')
        expect(json).to have_key('startdate')
        expect(json).to have_key('enddate')
        expect(json).to have_key('note')
        expect(json).to have_key('visibility')
        expect(json).to have_key('alerts')
        expect(json).to_not have_key('created_at')
        expect(json).to_not have_key('updated_at')
      end

      it "does return the correct attributes" do
        get "/v1/slots/#{slot.id}"
        json = JSON.parse(response.body)
        expect(json['id']).to eq(slot.id)
        expect(json['title']).to eq(slot.title)
        expect(json['startdate']).to eq(slot.startdate.iso8601)
        expect(json['enddate']).to eq(slot.enddate.iso8601)
        expect(json['note']).to eq(slot.note)
        expect(json['visibility']).to eq(slot.visibility)
        expect(json['alerts']).to eq(slot.alerts)
      end

      it "does return the slot title" do
        slot = create(:slot, title: "Expected title")
        get "/v1/slots/#{slot.id}"
        json = JSON.parse(response.body)
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

  describe "POST /v1/slots" do
    context "with valid params" do
      let(:valid_slot) { attributes_for(:slot) }

      it "responds with http status Created (201)" do
        post "/v1/slots/", valid_slot
        expect(response).to have_http_status(:created)
      end

      it "respondes with an ID only" do
        post "/v1/slots/", valid_slot
        json = JSON.parse(response.body)
        expect(json).to have_key('id')
        expect(json).to_not have_key('title')
        expect(json).to_not have_key('created_at')
      end

      it "adds a new entry to the DB" do
        expect {
          post "/v1/slots/", valid_slot
        }.to change(Slot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/slots/", valid_slot
        json = JSON.parse(response.body)
        expect(json['id']).to eq(Slot.last.id)
      end
    end

    context "with invalid params" do
      describe "does not add a new entry to the DB" do
        it "for empty title" do
          expect {
            post "/v1/slots/", attributes_for(:slot, title: nil)
          }.not_to change(Slot, :count)
        end

        it "for empty startdate" do
          expect {
            post "/v1/slots/", attributes_for(:slot, startdate: "")
          }.not_to change(Slot, :count)
        end
      end

      describe "responds with http status Unprocessable Entity (422)" do
        it "for empty title" do
          post "/v1/slots/", attributes_for(:slot, title: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty startdate" do
          post "/v1/slots/", attributes_for(:slot, startdate: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid startdate" do
          post "/v1/slots/", attributes_for(:slot, startdate: "|$%^@wer")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty enddate" do
          post "/v1/slots/", attributes_for(:slot, enddate: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid enddate" do
          post "/v1/slots/", attributes_for(:slot, enddate: "|$%^@wer")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if startdate equals enddate" do
          slot = attributes_for(:slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-09-08 13:31:02")
          post "/v1/slots/", slot
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if startdate after enddate"  do
          slot = attributes_for(:slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-07-07 13:31:02")
          post "/v1/slots/", slot
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty visibility" do
          post "/v1/slots/", attributes_for(:slot, visibility: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          post "/v1/slots/", attributes_for(:slot, visibility: "$$")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if visibility has to much characters" do
          post "/v1/slots/", attributes_for(:slot, visibility: "101")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty alerts" do
          post "/v1/slots/", attributes_for(:slot, alerts: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for alerts" do
          post "/v1/slots/", attributes_for(:slot, alerts: "$$")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if characters missing for alerts" do
          post "/v1/slots/", attributes_for(:slot, alerts: "101")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if to many characters for alerts" do
          post "/v1/slots/", attributes_for(:slot, alerts: "11101101100")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /v1/slots/:id" do
    context "with valid params" do
      it "responds with http status No Content (204)" do
        patch "/v1/slots/#{slot.id}", { title: "Something" }
        expect(response).to have_http_status(:no_content)
      end

      it "updates the title of a given slot" do
        slot = create(:slot, title: "Old title")
        patch "/v1/slots/#{slot.id}", { title: "New title" }
        slot.reload
        expect(slot.title).to eq("New title")
      end

      it "updates the startdate of a given slot" do
        slot = create(:slot, startdate: "2014-09-08 13:31:02")
        patch "/v1/slots/#{slot.id}", { startdate: "2014-07-07 13:31:02" }
        slot.reload
        expect(slot.startdate).to eq("2014-07-07 13:31:02")
      end

      it "updates the enddate of a given slot" do
        slot = create(:slot, enddate: "2014-09-09 13:31:02")
        patch "/v1/slots/#{slot.id}", { enddate: "2014-11-11 13:31:02" }
        slot.reload
        expect(slot.enddate).to eq("2014-11-11 13:31:02")
      end

      it "updates the note of a given slot" do
        slot = create(:slot, note: "Old note")
        patch "/v1/slots/#{slot.id}", { note: "New note" }
        slot.reload
        expect(slot.note).to eq("New note")
      end

      it "empty string deletes a note of a given slot" do
        slot = create(:slot, note: "Old note")
        patch "/v1/slots/#{slot.id}", { note: "" }
        slot.reload
        expect(slot.note).to eq("")
      end

      it "updates the visibility of a given slot" do
        slot = create(:slot, visibility: "00")
        patch "/v1/slots/#{slot.id}", { visibility: "11" }
        slot.reload
        expect(slot.visibility).to eq("11")
      end

      it "updates the alerts of a given slot" do
        slot = create(:slot, alerts: "0001110001")
        patch "/v1/slots/#{slot.id}", { alerts: "1111011110" }
        slot.reload
        expect(slot.alerts).to eq("1111011110")
      end

      describe "handling media items" do
        let!(:slot) { create(:slot) }
        let(:add_media_item) { { new_media: media } }

        context "adding images with valid params" do
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
            json = JSON.parse(response.body)
            expect(json).to have_key('media_item_id')
          end

          it "returns the ID of new media_item" do
            patch "/v1/slots/#{slot.id}", add_media_item
            slot.reload
            json = JSON.parse(response.body)
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
            create(:media_item, slot: slot, ordering: 0)

            patch "/v1/slots/#{slot.id}", add_media_item
            slot.reload
            expect(slot.media_items.size).to eq(2)
          end

          it "adds a 2nd  submitted image to the db" do
            create(:media_item, slot: slot, ordering: 0)

            patch "/v1/slots/#{slot.id}", add_media_item
            slot.reload
            expect(slot.media_items[1].media_type).to eq(media[:media_type])
            expect(slot.media_items[1].public_id).to eq(media[:public_id])
            expect(slot.media_items[1].ordering).to eq(media[:ordering].to_i)
          end

          context "missing ordering parameter" do
            let(:media) do
              { media_type: "image",
                public_id: "foo-image" }
            end

            it "adds a missing ordering parameter" do
              create(:media_item, slot: slot, ordering: 0)
              new_ordering = slot.media_items.size
              patch "/v1/slots/#{slot.id}", add_media_item

              expect(response).to have_http_status(:created)
              slot.reload
              expect(slot.media_items[1].ordering).to eq(new_ordering)
            end
          end
        end

        context "adding images with invalid params" do
          let(:media) do
            { media_type: "image",
              ordering: "0" }
          end

          it "returns 422" do
            patch "/v1/slots/#{slot.id}", add_media_item
            expect(response).to have_http_status(:unprocessable_entity)
          end

        end

        describe "reordering images" do
          let!(:media_item_1) { create(:media_item, slot: slot, ordering: 0) }
          let!(:media_item_2) { create(:media_item, slot: slot, ordering: 1) }
          let!(:media_item_3) { create(:media_item, slot: slot, ordering: 2) }

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
              let(:invalid_id) { media_item_3.id + 1 }
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

        context "audio" do
          let(:media) do
            { media_type: "audio",
              public_id: "foo-audio",
              ordering: "1" }
          end

          it "adds a new audio item" do
            patch "/v1/slots/#{slot.id}", add_media_item
            slot.reload
            expect(slot.media_items[0].media_type).to eq(media[:media_type])
          end
        end
      end
    end

    context "with invalid params" do
      describe "for invalid ID" do
        it "responds with http status Not Found (404)" do
          wrong_id = slot.id + 1
          patch "/v1/slots/#{wrong_id}", { title: "Something" }
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "responds with http status Unprocessable Entity (422)" do
        it "for empty title" do
          patch "/v1/slots/#{slot.id}", { title: "" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty startdate" do
          patch "/v1/slots/#{slot.id}", { startdate: "" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid startdate" do
          patch "/v1/slots/#{slot.id}", { startdate: "|$%^@wer" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty enddate" do
          patch "/v1/slots/#{slot.id}", { enddate: "" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid enddate" do
          patch "/v1/slots/#{slot.id}", { enddate: "|$%^@wer" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if startdate equals enddate" do
          slot = create(:slot, startdate: "2014-09-08 13:31:02")
          patch "/v1/slots/#{slot.id}", { enddate: "2014-09-08 13:31:02" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if enddate before startdate" do
          slot = create(:slot, startdate: "2014-09-08 13:31:02")
          patch "/v1/slots/#{slot.id}", { enddate: "2014-07-07 13:31:02" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty visibility" do
          patch "/v1/slots/#{slot.id}", { visibility: "" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          patch "/v1/slots/#{slot.id}", { visibility: "$$" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if visibility has to much characters" do
          patch "/v1/slots/#{slot.id}", { visibility: "101" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty alerts" do
          patch "/v1/slots/#{slot.id}", { alerts: "" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for alerts" do
          patch "/v1/slots/#{slot.id}", { alerts: "$$" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if characters missing for alerts" do
          patch "/v1/slots/#{slot.id}", { alerts: "101" }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if to many characters for alerts" do
          patch "/v1/slots/#{slot.id}", { alerts: "11101101100" }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "DELETE /v1/slots/:id" do
    let!(:slot) { create(:slot) }

    context "with a valid ID" do
      it "returns http No Content (204)" do
        delete "/v1/slots/#{slot.id}"
        expect(response).to have_http_status(:no_content)
      end

      it "destroys the requested slot" do
        expect {
          delete "/v1/slots/#{slot.id}"
        }.to change(Slot, :count).by(-1)
      end
    end

    context "with an invalid ID" do
      it "responds with http status Not Found" do
        wrong_id = slot.id + 1
        delete "/v1/slots/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end

      it "does not remove an entry from the DB" do
        wrong_id = slot.id + 1
        expect {
          delete "/v1/slots/#{wrong_id}"
        }.not_to change(Slot, :count)
      end
    end

  end
end
