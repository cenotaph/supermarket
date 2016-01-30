class Admin::PnpsController < Admin::BaseController
  
  def index
    @pnps = Pnp.all
  end
  
  def show
    @pnp = Pnp.find(params[:id])
  end
  
end