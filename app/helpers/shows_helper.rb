module ShowsHelper

  @@time = Date.today

  def time
    @@time
  end

  def time=(value)
    @@time = value if value.kind_of? Date
  end

  # Output the year range for the displayed shows
  # * If the given year is a past year, then return given
  # * If this year is beyond June, return range of this year to next year
  def display_show_year(startYear = @@time.year)
    if startYear < @@time.year
      year_text = startYear
    elsif @@time.month >= 6
      year_text = "#{startYear} - #{@@time.next_year.year}"
    else
      year_text = startYear           
    end
  end

  def display_year_list
    year = @@time.year
    prev_year = @@time.prev_year.year
    prev_prev_year = @@time.prev_year(2).year

    html = ''
    html << '<ul id="yearslist">'
    html << '<li>' + link_to(prev_prev_year, year_shows_path(:year => prev_prev_year), :title => prev_prev_year) + '</li>'
    html << '<li>' + link_to(prev_year, year_shows_path(:year => prev_year), :title => prev_year) + '</li>'
    html << '<li>' + link_to(year, year_shows_path(:year => year), :title => year) + '</li>'
    html << '</ul>'

    html.html_safe
  end
end
