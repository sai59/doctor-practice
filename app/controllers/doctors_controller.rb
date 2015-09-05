class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :doctor, :only => [:edit, :update]
  
  def index
    @doctors = User.where(role: 'doctor').to_a
  end
  
  def edit
    
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctor_path(@doctor), notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end
end
