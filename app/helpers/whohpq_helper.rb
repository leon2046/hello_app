module WhohpqHelper

  # def display_whohpq_link?(user)
  #   user.isPaper? ||
  #   !CreateQuestionnaireCompanySetting.exists?(:company_pk => user.company_pk) ||
  #   CreateQuestionnaireAnswersWhohpq.exists?(:user_pk => user.user_pk)
  # end

  def display_whohpq_link?(user = @current_user)
    Rails.logger.debug(">>>>>> display_whohpq_link #{user.present?}")
    return true
  end

end
