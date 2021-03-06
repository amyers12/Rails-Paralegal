class PriorPoliciesController < ApplicationController
  def new
    @prior = PriorPolicy.new
    @buyer = Buyer.find(params[:buyer_id])
  end

  def create
    @prior = PriorPolicy.create(prior_policy_params)
      if @prior.save
        redirect_to buyer_prior_policy_path(@prior.buyer_id, @prior.id)
      end
  end

  def show
    @prior = PriorPolicy.find(params[:id])
    @buyer = Buyer.find(params[:buyer_id])
  end

  def edit
    @prior = PriorPolicy.find(params[:id])
    @buyer = Buyer.find(params[:buyer_id])
  end

  def update
    @prior = PriorPolicy.find(params[:id])
    respond_to do |format|
      if @prior.update(prior_policy_params)
        format.html {redirect_to buyer_prior_policy_path(@prior.buyer_id, @prior), notice: "Prior Policy info has been updated"}
      else
        format.html {render :edit}
      end
    end
  end

  private
  def prior_policy_params
    params.require(:prior_policy).permit(:pp_exists, :pp_copy, :buyer_id)
  end
end
