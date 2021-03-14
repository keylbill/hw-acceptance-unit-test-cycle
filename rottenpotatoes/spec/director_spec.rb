require 'rails_helper'

describe MoviesController, :type => :controller do
    describe 'GET similar' do
        it "goes to page with similar movies if a director exists" do
            # set up all the fake data for the test
            fake_movie = double('Movie')
            allow(Movie).to receive(:find).and_return(fake_movie)
            allow(fake_movie).to receive(:find_same_director).and_return(fake_movie)
            allow(fake_movie).to receive(:director).and_return("Director")
            # call the method and check the response
            get 'similar', {:id => 1}
            expect(response).to render_template("movies/similar")
        end
        
        it "redirects to the main page if there is no director (empty string)" do
            fake_movie = double('Movie')
            allow(Movie).to receive(:find).and_return(fake_movie)
            allow(fake_movie).to receive(:find_same_director).and_return(fake_movie)
            allow(fake_movie).to receive(:director).and_return("")
            allow(fake_movie).to receive(:title).and_return("Film")
            get 'similar', {:id => 1}
            expect(response).to redirect_to("/movies")
        end
        
        it "redirects to the main page if there is no director (nil)" do
            fake_movie = double('Movie')
            allow(Movie).to receive(:find).and_return(fake_movie)
            allow(fake_movie).to receive(:find_same_director).and_return(fake_movie)
            allow(fake_movie).to receive(:director).and_return(nil)
            allow(fake_movie).to receive(:title).and_return("Film")
            get 'similar', {:id => 1}
            expect(response).to redirect_to("/movies")
        end
    end
end
