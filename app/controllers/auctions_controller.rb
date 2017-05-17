class AuctionsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :find_auction, only: [:show]

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to @auction
    else
      render :new
    end
  end

  def show
    @bid = Bid.new(auction: @auction)
    @bids = @auction.bids
  end

  def index
    @auctions = Auction.all
  end

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :details, :end_date, :reserve_price)
  end
end
