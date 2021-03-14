# this code is basically copied from the example in the SaaS book (Figure 8.8)

FactoryBot.define do
    factory :movie do
        title {'Film'}
        rating {'PG'}
        director {'George Lucas'}
        release_date {10.years.ago}
    end
end