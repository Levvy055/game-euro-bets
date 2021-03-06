class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setup_locales
  before_action :set_locale
  helper_method :current_locale, :current_user, :current_user_is_admin, :require_bet_active
  
  def set_locale(locale = nil)
    I18n.locale = (locale == nil ? extract_locale_from_tld : extract_locale_from_tld(locale))
  end
  
  def extract_locale_from_tld(parsed_locale = params[:locale])
    @locales.include?(parsed_locale) ? parsed_locale : I18n.locale
  end

  def current_locale
    params[:locale] || I18n.locale
  end

  def setup_locales
    @locales = I18n.available_locales.map(&:to_s);
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user_is_admin
    current_user && current_user.is_admin
  end
  
  def require_user
    redirect_to login_page_path, :alert => t('errors.messages.not_logged_in') unless current_user
  end
  
  def require_admin
    redirect_to root_path, :alert => t('errors.messages.not_admin') unless current_user_is_admin
  end
  
  def require_bet_active(bet)
    res = !current_user || bet == nil || bet.match == nil || !bet.match.are_bets_active
    redirect_to all_bets_path, :alert => t('errors.messages.bet_disabled') if res
  end
end
