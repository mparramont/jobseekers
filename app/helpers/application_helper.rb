module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Jobseekers"
    end
  end
end
