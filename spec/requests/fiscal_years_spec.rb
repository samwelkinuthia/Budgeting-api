require 'swagger_helper'

RSpec.describe 'fiscal_years', type: :request do
  path '/fiscal_years' do
    get('list fiscal_years') do
      response(200, 'successful') do
        tags 'Fiscal Year'
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create fiscal_year') do
      response(200, 'successful') do
        tags 'Fiscal Year'

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/fiscal_years/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show fiscal_year') do
      response(200, 'successful') do
        tags 'Fiscal Year'

        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update fiscal_year') do
      response(200, 'successful') do
        tags 'Fiscal Year'

        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete fiscal_year') do
      response(200, 'successful') do
        tags 'Fiscal Year'

        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
