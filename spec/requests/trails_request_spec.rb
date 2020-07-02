require 'rails_helper'

RSpec.describe "Trails", type: :request do
  describe 'GET #index' do
    before(:example) do
      # Arrange
      @first_trail = create(:trail)
      @last_trail = create(:trail)

      #Act
      get '/trails'
      @json_response = JSON.parse(response.body)
    end

    #Assertions

    it 'returns http success code' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON response contains the correct number of entries' do
      expect(@json_response['trails'].count).to eq(2)
    end

    it 'JSON response body contains the expected attributes' do
      expect(@json_response['trails'][0]).to include({
        'id' => @first_trail.id,
        'name' => @first_trail.name,
        'difficulty' => @first_trail.difficulty
      })
    end
  end

  describe 'POST #create' do
    context 'when the trail is valid' do
      before(:example) do
        @trail_params = attributes_for(:trail)
        post '/trails', params: {trail: @trail_params }
      end

      it 'returns a http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the Trail to the database' do
        expect(Trail.last.name).to eq(@trail_params[:name])
      end
    end

    context 'when the trail is invalid' do
      before(:example) do
        @trail_params = attributes_for(:trail, :invalid)
        post '/trails', params: { trail: @trail_params }
        @json_response = JSON.parse(response.body)
      end

      it 'returns status unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end

      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Name can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:example) do
      # Arrange
      @trail1 = create(:trail)
      @trail2 = create(:trail)
      # p Trail.all
      delete "/trails/#{@trail1.id}"
    end

    it 'has a http no content response status' do
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the Trail from the database' do
      expect(Trail.count).to eq(1)
    end
  end

  describe "PUT #update" do
    context 'when the params are valid' do

      before(:example) do
        # Arrange
        @trail1 = create(:trail)
        @updated_name = "Updated Trail"
        put "/trails/#{@trail1.id}", params: { trail: { name: @updated_name} }
        p @trail1
      end

      it 'returns a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end

      it 'update the trail attributes information in the database' do
        expect(Trail.find(@trail1.id).name).to eq("Updated Trail")
      end
    end

    context 'when the params are invalid' do
      before(:example) do
        @trail = create(:trail)
        put "/trails/#{@trail.id}", params: {trail:{name:nil}}
        @json_response = JSON.parse(response.body)
      end

      it 'returns a unprocessable entity response' do
        expect((response)).to have_http_status(:unprocessable_entity)
      end

      it 'has the correct number of errors' do
        expect(@json_response['errors'].count).to eq(2)
      end
    end
  end

end
