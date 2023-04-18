# frozen_string_literal: true

module ApplicationHelper
  def icon_class(type)
    return 'bi bi-check-lg icon-success' if type == 'success'
    return 'bi bi-exclamation-circle icon-error' if type == 'error'
  end
end
