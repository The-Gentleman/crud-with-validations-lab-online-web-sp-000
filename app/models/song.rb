class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: {in: [true, false]}
    with_options if: :released?  do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
        less_than_or_equal_to: Date.today.year
        }
    end 
    validates :artist_name, presence: true


    def released?
        released 
    end 

end

# validates :card_number, presence: true, if: :paid_with_card?
   
# def paid_with_card?
#   payment_type == "card"
# end
