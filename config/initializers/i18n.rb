I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
I18n.default_locale = :en
I18n.available_locales = [:en, :sv]
I18n.fallbacks[:en] = [:en, :sv] 
I18n.fallbacks[:sv] = [:sv, :en ]
