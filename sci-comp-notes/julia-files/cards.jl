type Card
    rank::Int
    suit::Int
    Card(r::Int,s::Int)=new(r,s)
    Card(i::Int) = i%13==0? new(13,int(ceil(i/13))) : new(i%13,int(ceil(i/13)))
end

ranks = ["A","2","3","4","5","6","7","8","9","T","J","Q","K"];
suits = ["C","S","D","H"];

function printCard(c::Card)
    return string(ranks[c.rank],suits[c.suit]);
end

function cardrank(c::Card)
    return c.rank
end

function cardsuit(c::Card)
    return c.suit
end

type Hand
    cards::Array{Card,1}
end

function printHand(h::Hand)
    join(map(printCard,h.cards),",")
end

function isFullHouse(h::Hand)
    local cranks=sort(map(cardrank,h.cards))
    return cranks[2]==cranks[1] && cranks[5]==cranks[4] && (cranks[3]==cranks[2] || cranks[4]==cranks[3]);
end

function testHand(trials::Int,f)
	local deck=[1:52], numhands=0, h

	for i=1:trials
    	shuffle!(deck)
    	h = Hand(map(Card,deck[1:5]))
    	if(f(h))
        	numhands+=1
    	end
	end
	numhands
end