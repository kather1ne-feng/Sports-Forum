module EventsHelper
  def sport_emoji(sport)
    {
      "Basketball" => "🏀",
      "Soccer" => "⚽️",
      "Football" => "🏈",
      "Baseball" => "⚾️",
      "Hockey" => "🏒",
      "Golf" => "🏌️",
      "Volleyball" => "🏐",
      "Tennis" => "🎾",
      "Ultimate Frisbee" => "🥏",
      "Pickleball" => "🏓",
      "Other" => "🎯"
    }[sport] || "❓"
  end
end
