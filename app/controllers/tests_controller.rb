class TestsController < ApplicationController
  before_action :set_course
  before_action :set_test, only: %i[ show edit update destroy ]

  # GET /tests or /tests.json
  def index
    @tests = @course.tests
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = @course.tests.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = @course.tests.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test.destroy!

    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:title, :lesson_id)
    end
end
