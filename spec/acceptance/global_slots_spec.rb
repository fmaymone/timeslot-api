require 'documentation_helper'

resource "GlobalSlots" do
  let(:json) { JSON.parse(response_body) }

  get "/v1/globalslots/search", :vcr, :seed do
    header "Accept", "application/json"

    parameter :category,
              "Basic slot category to search in. Valid categories: " \
              "[cinema, football] ", required: true
    parameter :q, "String to search global slots for", required: true
    parameter :moment, "find results after this datetime, default: Time.now"
    parameter :limit, "maximum number of results, default: 20"

    describe "cinema" do
      let(:category) { 'cinema' }
      let(:q) { 'James' }
      let(:moment) { '2015-11-29T12:43:28.907Z'}
      let(:limit) { 10 }

      example "Cinema - Find global slots", document: :v1 do
        explanation "Forwards a search request to the Elastic Search Service " \
                    "for global slots from the data team.\n\n" \
                    "returns 422 if parameters invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("result")

        result = json['result']
        expect(result.length).to eq limit

        first = result.first
        expect(first).to have_key("muid")
        expect(first).to have_key("title")
        expect(first).to have_key("startDate")
        expect(first).to have_key("endDate")
        expect(first).to have_key("image")
        expect(first).to have_key("location")
        expect(first['location']).to have_key("name")
        expect(first['location']).to have_key("thoroughfare")
        expect(first['location']).to have_key("locality")
        expect(first['location']).to have_key("country")
        expect(first['location']).to have_key("latitude")
        expect(first['location']).to have_key("longitude")
        expect(first).to have_key("sources")
        expect(first['sources'].first).to have_key("name")
        expect(first['sources'].first).to have_key("url")
        expect(first['sources'].first).to have_key("image")

        expect(first).not_to have_key("id")
        expect(first).not_to have_key("settings")
        expect(first).not_to have_key("createdAt")
        expect(first).not_to have_key("updatedAt")
        expect(first).not_to have_key("deletedAt")
        expect(first).not_to have_key("likes")
        expect(first).not_to have_key("commentsCounter")
        expect(first).not_to have_key("reslotsCounter")
        expect(first).not_to have_key("shareUrl")
        expect(first).not_to have_key("visibility")
      end
    end

    describe "football" do
      let(:category) { 'football' }
      let(:q) { 'Borussia' }
      let(:moment) { '2015-07-05'}
      let(:limit) { 15 }

      example "Football - Find global slots", document: :v1 do
        explanation "Forwards a search request to the Elastic Search Service " \
                    "for global slots from the data team.\n\n" \
                    "returns 422 if parameters invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("result")

        result = json['result']
        expect(result.length).to eq limit

        first = result.first
        expect(first).to have_key("muid")
        expect(first).to have_key("title")
        expect(first).to have_key("startDate")
        expect(first).to have_key("endDate")
        expect(first).to have_key("image")
        expect(first).to have_key("location")
        expect(first['location']).to have_key("name")
        expect(first['location']).to have_key("thoroughfare")
        expect(first['location']).to have_key("locality")
        expect(first['location']).to have_key("country")
        expect(first['location']).to have_key("latitude")
        expect(first['location']).to have_key("longitude")
        expect(first).to have_key("sources")
        expect(first['sources'].first).to have_key("name")
        expect(first['sources'].first).to have_key("url")
        expect(first['sources'].first).to have_key("image")

        expect(first).not_to have_key("id")
        expect(first).not_to have_key("settings")
        expect(first).not_to have_key("createdAt")
        expect(first).not_to have_key("updatedAt")
        expect(first).not_to have_key("deletedAt")
        expect(first).not_to have_key("likes")
        expect(first).not_to have_key("commentsCounter")
        expect(first).not_to have_key("reslotsCounter")
        expect(first).not_to have_key("shareUrl")
        expect(first).not_to have_key("visibility")
      end
    end
  end
end
