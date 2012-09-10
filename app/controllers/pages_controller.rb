class PagesController < ApplicationController

  caches_action :home, cache_path: proc { |c|
    show = Show.where( :date.gte => Date.today ).asc(:date).first()
    unless show.nil?
      { tag: show.updated_at.to_i }
    end
  }
  caches_page :contact, :about


  def home
  	@title = 'Home'
    @next_show = Show.where( :date.gte => Date.today ).asc(:date).first()
    @index_news = Story.where( :date.gte => Date.today.prev_month(3) )
  end

  def contact
  	@title = 'Contact'
  end

  def about
  	@title = 'About'
  end

  def news
    @title = 'News'
    @all_news = Story.desc(:Date).all();
  end

  def shop
    @title = 'Shop'
  end

end
