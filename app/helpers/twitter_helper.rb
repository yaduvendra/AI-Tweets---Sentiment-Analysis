module TwitterHelper
  ACCOUNT_HANDLES = ['joeycarmello', 'gregguida']
  
  def twitter_random_first
    @rand ||= ACCOUNT_HANDLES.sort_by { rand }
    @rand.first
  end
  
  def twitter_random_second
    @rand ||= ACCOUNT_HANDLES.sort_by { rand }
    @rand.second
  end

end
