require 'rails_helper'

describe Movie do
    describe '#find_same_director' do
        it "should have only movies with the given director" do
            search_movie = FactoryBot.build(:movie)
            FactoryBot.build(:movie)
            FactoryBot.build(:movie, :director => 'Not George')
            movie_list = search_movie.find_same_director
            expect(movie_list.count).to eq(2)
            movie_list.each do |movie|
                expect(movie.director).to eq("George Lucas")
            end
        end
    end
end