module Csv
  def import_csv(csv_file)

    a = Project.import! csv_file, validate: true, validate_uniqueness: true

    if a.failed_instances.size < 1
      render json: {message:"#{csv_file.size} projects successfully imported", success: true}, status: :created
    else
      render json: {message:"#{a.failed_instances.size} imports failed", success: false},  status: :unprocessable_entity
    end
    # if !errors.nil?
    #   render json: { success: success, data: object, errors: errors.full_messages }, status: status
    # else
    #   render json: { success: success, data: object, errors: errors.full_messages }, status: status
    # end
  end
end
