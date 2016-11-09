module TropicalMath

export ⊕,⊗,trop_pow

function ⊕{T1<:Number,T2<:Number}(x::T1,y::T2)
    min(x,y) 
end

function ⊕{T<:Number}(x::T...)
    minimum(x)
end

function ⊕{T1<:Number,T2<:Number}(A::Array{T1,1},B::Array{T2,1})
    length(A)==length(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    map(⊕,A,B)
end

function ⊕{T1<:Number,T2<:Number}(A::Array{T1,2},B::Array{T2,2})
    map(⊕,A,B)
end

function ⊗{T1<:Number,T2<:Number}(x::T1,y::T2)
    x+y
end

function ⊗(x::Number...)
    sum(x)
end

function ⊗{T1<:Number,T2<:Number}(A::Array{T1,1},B::Array{T2,1})
    length(A)==length(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    local v=zeros(Float64,length(A))
    #println(v)
    for i=1:length(A)
        v[i]=A[i]⊗B[i]
    end
    ⊕(v...)
end

function ⊗{T1<:Number,T2<:Number}(A::Array{T1,2},B::Array{T2,2})
    size(A,2)==size(B,1) || throw(ArgumentError("The matrices must be compatible."))
    local C = zeros(Float64,size(A,1),size(B,2))
    for i=1:size(A,1) 
        for j=1:size(B,2)
            C[i,j]=A[i,:]⊗B[:,j]
        end
    end
    C
end

function trop_pow{T<:Number}(A::Array{T,2},n::Integer)
    size(A,1)==size(A,2) || throw(ArgumentError("The matrix must be square to raise it to a power."))
    n>0 || throw(ArgumentError("you can only raise it to a positive power"))
    B=copy(A)
    for i=2:n
       B=B⊗A
    end
    B
end

end