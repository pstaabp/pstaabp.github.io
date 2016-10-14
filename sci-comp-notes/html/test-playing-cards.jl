### check to see if the current directory is in the load path and if not, load it.  
if !("." in LOAD_PATH)
    push!(LOAD_PATH,".")
end

using PlayingCards
using Base.Test

function isequal(x::Card,y::Card)
    return x.rank==y.rank && x.suit==y.suit 
end


## test the creation of a card


c1=Card(12)
c2=Card(12,1)
c3=Card(29)
c4=Card(3,3)

fh1 = Hand([Card(4,1),Card(4,2),Card(4,3),Card(7,3),Card(7,4)]) # this is a full house
fh2 = Hand([Card(4,1),Card(4,2),Card(4,3),Card(4,4),Card(7,1)]) # this is a 4-of-a-kind

@testset "Playing Card Tests" begin
    @testset "Card Tests" begin
        @test isa(c1, Card)
        @test isequal(c1,c2)
        @test isequal(c3,c4)
    end
    @testset "Full House" begin
        @test is_full_house(fh1) 
        @test !is_full_house(fh2)
    end
    
end



