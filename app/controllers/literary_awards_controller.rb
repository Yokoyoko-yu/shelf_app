class LiteraryAwardsController < ApplicationController
    #賞の一覧を見る
    def show    
        @awards=LiteraryAward.all
    end

    def check
        @award=LiteraryAward.find(params[:id])
        @award_books = AwardBook.where(literary_award_id: @award.id).order(times: :desc)
    end
end
