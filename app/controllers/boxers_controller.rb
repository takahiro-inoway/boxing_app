class BoxersController < ApplicationController
  before_action :set_boxer, only: %i[ show edit update destroy ]

  # GET /boxers or /boxers.json
  def index
    @boxers = Boxer.search(params[:search])
  end

  # GET /boxers/1 or /boxers/1.json
  def show
  end

  # GET /boxers/new
  def new
    @boxer = Boxer.new
  end

  # GET /boxers/1/edit
  def edit
  end

  # POST /boxers or /boxers.json
  def create
    @boxer = Boxer.new(boxer_params)

    respond_to do |format|
      if @boxer.save
        format.html { redirect_to @boxer, notice: "Boxer was successfully created." }
        format.json { render :show, status: :created, location: @boxer }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @boxer.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /boxers/1 or /boxers/1.json
  def update
    respond_to do |format|
      if @boxer.update(boxer_params)
        format.html { redirect_to @boxer, notice: "Boxer was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @boxer }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @boxer.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /boxers/1 or /boxers/1.json
  def destroy
    @boxer.destroy!

    respond_to do |format|
      format.html { redirect_to boxers_path, notice: "Boxer was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boxer
      @boxer = Boxer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def boxer_params
      params.expect(boxer: [ :name, :weight_class, :record, :style ])
    end
end
