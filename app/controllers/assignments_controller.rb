class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy, :submission,:destroy_submission,:edit_submission,:update_submission]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    if user_signed_in?
      @submission = @assignment.submissions.build(user_id: current_user.id)
      @flag = 0
      if current_user.submissions.exists?(assignment_id: @assignment.id)
        @flag = 1
        @submission = current_user.submissions.find_by(assignment_id: @assignment.id)
      end
    end
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def destroy_submission
    puts @assignment
    @assignment.submissions.find_by(user_id: current_user.id).destroy
    respond_to do |format|
      format.html { redirect_to @assignment, notice: '과제가 성공적으로 삭제되었습니다.' }
      format.json { head :no_content }
    end
  end
  
  def submission
    @submission = Submission.new(submission_params)
    @submission.user = current_user
    @submission.assignment = @assignment
    @submission.save
    redirect_back(fallback_location: root_path)
  end
  
  def edit_submission
    @submission = @assignment.submissions.find_by(user_id: current_user.id)
    @flag = 2
    render 'show'
  end
  
  def update_submission
    @submission = @assignment.submissions.find_by(user_id: current_user.id)
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:image,:url)

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:title,:content)
    end
end
