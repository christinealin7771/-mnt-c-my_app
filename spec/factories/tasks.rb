FactoryBot.define do
  factory :task do
    task { "MyString" }
    done { false }
    week_day { "2021-03-22" }
    remaining_time { "2021-03-22 20:28:09" }
    user { "" }
  end
end
