class InstructorsController < ApplicationController


    def index
        render json: Instructor.all, status: :ok
    end

    def show
        inst = find_inst
        render json: inst, status: :ok
    end

    def create
        inst = Instructor.create!(instuctor_params)
        render json: inst, status: :created
    end

    def update
        inst = find_inst
        inst.update!(instuctor_params)
        render json: inst, status: :accepted
    end

    def destroy
        inst = find_inst
        inst.destroy
        head :no_content
    end

    private

    def instuctor_params
        params.permit(:id, :name)
    end

    def find_inst
        Instructor.find(params[:id])
    end
end
