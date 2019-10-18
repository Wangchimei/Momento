module FeedsHelper
  def button_text
  if action_name == "new" || action_name == "create" || action_name == "confirm"
    "シェアする"
  elsif action_name == "edit"
    "保存"
  end
  end
end
