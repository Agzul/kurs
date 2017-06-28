class WorkersController < ApplicationController
  before_action :set_worker,           only: [:show, :edit, :update, :destroy]
  before_action :deny_access_no_role,  only: [:edit, :update, :destroy]
  before_action :deny_access_operator, only: [:destroy]
  skip_before_action :check_app_auth

  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
    @worker.build_department
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def deny_access_no_role
      if user_priority == 0
        redirect_to workers_path()
        flash[:danger] = 'Недостаточно прав'
      else
        @worker = Worker.find(params[:id])
      end
    end

    def deny_access_operator
      if user_priority == 2
        @worker = Worker.find(params[:id])
      else
        redirect_to workers_path()
        flash[:danger] = 'Недостаточно прав'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:sn, :fn, :ln, :passport, :inn, :birthday, :position, :department_id,
      department_attributes: [:id, :name, :_destroy])
    end
end
