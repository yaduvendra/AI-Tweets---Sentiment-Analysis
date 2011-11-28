class SentimentGroupsController < ApplicationController
  def index
    @sentiment_groups = SentimentGroup.all
  end

  def show
    @sentiment_group = SentimentGroup.find(params[:id])
  end

  def new
    @sentiment_group = SentimentGroup.new
    @brands = Brand.all
  end

  def create
    @sentiment_group = SentimentGroup.new(params[:sentiment_group])
    if @sentiment_group.save
      redirect_to @sentiment_group, notice: make_response('success', 'Sentiment Group created successfully')
    else
      redirect_to new_sentiment_group_path, notice: make_response('error', make_error(@sentiment_group))
    end
  end

  def edit
    @sentiment_group = SentimentGroup.find(params[:id])
    @brands = Brand.all
  end

  def update
    @sentiment_group = SentimentGroup.find(params[:id])
    @sentiment_group.sentiment_group_members.destroy_all
    if @sentiment_group.update_attributes(params[:sentiment_group])
      redirect_to @sentiment_group, notice: make_response('success', 'Successfully updated Sentiment Group')
    else
      redirect_to edit_sentiment_group_path(@sentiment_group)
    end
  end

  def destroy
    @sentiment_group = SentimentGroup.find(params[:id])
    @sentiment_group.sentiment_group_members.destroy_all
    @sentiment_group.destroy
    redirect_to sentiment_groups_path, notice: make_response('success', 'Deleted Sentiment group')
  end

end
