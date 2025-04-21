module ProfilesHelper
    def initials_for(profile)
      return "NA" unless profile.full_name.present?
      profile.full_name.split.map(&:first).join[0..1].upcase
    end
  end
  