class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[ show edit update destroy ]

  # GET /subscriptions or /subscriptions.json
  def index
    @subscriptions = Subscription.where(user_id: current_user.id)
    @user = current_user
    @newsletters = Newsletter.all
  end

  # GET /subscriptions/1 or /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])
    @user = current_user
    @newsletters = Newsletter.all
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    @newsletters = Newsletter.all
    @user = current_user
  end

  # Get /subscriptions/new/1
  def precreated_subscription
    # Create a new subscription with the newsletter_id from the URL for the current user
    @newsletters = Newsletter.find(params[:id])
    @user = current_user
    @subscription = Subscription.create(newsletter_id: params[:id], user_id: current_user.id)
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
    @newsletters = Newsletter.all
  end

  # POST /subscriptions or /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @newsletters = Newsletter.all
    @user = current_user

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1 or /subscriptions/1.json
  def destroy
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: "Subscription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:newsletter_id, :user_id)
    end
end
