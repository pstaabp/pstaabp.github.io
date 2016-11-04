module TropicalMath

export ⊕,⊗

function ⊕{T<:Number}(x::T,y::T)
    min(x,y) 
end

function ⊕{T<:Number}(x::T...)
    minimum(x)
end

function ⊕{T<:Number}(A::Array{T,1},B::Array{T,1})
    length(A)==length(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    map(⊕,A,B)
end

function ⊕{T<:Number}(A::Array{T,2},B::Array{T,2})
    map(⊕,A,B)
end

function ⊗{T<:Number}(x::T,y::T)
    x+y
end

function ⊗(x::Number...)
    sum(x)
end

function ⊗{T<:Number}(A::Array{T,1},B::Array{T,1})
    length(A)==length(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    local v=[]
    for i=1:length(A)
        push!(v,A[i]⊗B[i])
        
    end
    ⊕(v...)
end

function ⊗{T<:Number}(A::Array{T,2},B::Array{T,2})
    size(A,2)==size(B,1) || throw(ArgumentError("The matrices must be compatible."))
    local C = zeros(Int,size(A,1),size(B,2))
    for i=1:size(A,1) 
        for j=1:size(B,2)
            C[i,j]=A[i,:]⊗B[:,j]
        end
    end
    C
end

end