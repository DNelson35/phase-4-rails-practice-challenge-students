class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    private

    def render_invalid(e)
        render json: {errors: e.record.errors.full_message}, status: :unprocessable_entity
    end

    def render_not_found
        render json: {error: "Record not found"}, status: :not_found
    end
end
