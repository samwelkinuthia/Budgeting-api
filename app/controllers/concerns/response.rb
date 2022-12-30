module Response
  def json_response(object, status = :ok, errors = [], success = true, message = "", include=[])
    render json: { message: errors.count > 0 ? errors.full_messages.join(", ") : message, success: success, data: object, errors: errors.count > 0 ? errors.full_messages : errors }, status: status, include: include
    # if !errors.nil?
    #   render json: { success: success, data: object, errors: errors.full_messages }, status: status
    # else
    #   render json: { success: success, data: object, errors: errors.full_messages }, status: status
    # end
  end
end
