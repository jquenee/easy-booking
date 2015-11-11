Date::DATE_FORMATS[:default]="%d/%m/%Y"
Time::DATE_FORMATS[:default]="%d/%m/%Y"

class Date
  def as_json(options = nil)
     strftime("%d/%m/%Y")
  end
end
