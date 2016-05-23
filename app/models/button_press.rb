class ButtonPress < ActiveRecord::Base
  validates :pushed_at, presence: true

  def human_responded_to
    if responded_to
      "Responded To"
    else
      "Not Responded To"
    end
  end
end
