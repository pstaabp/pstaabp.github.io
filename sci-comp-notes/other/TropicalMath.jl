module TropicalMath

export ⊕,⊗,trop_pow

function ⊕(x::T1,y::T2) where {T1<: Real ,T2 <: Real}
    min(x,y)
end

function ⊕(x::T...) where T<:Real
    minimum(x)
end

function ⊕(A::Array{T1,1},B::Array{T2,1}) where {T1<: Real ,T2 <: Real}
    length(A)==length(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    map(⊕,A,B)
end

function ⊕(A::Array{T1,2},B::Array{T2,2}) where {T1<: Real ,T2 <: Real}
    size(A)==size(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    map(⊕,A,B)
end

function ⊗(x::T1,y::T2) where {T1<: Real ,T2 <: Real}
    x+y
end

function ⊗(A::Array{T1,1},B::Array{T2,1}) where T1 <: Real where T2<: Real
    length(A)==length(B) || throw(ArgumentError("The lengths of the vectors do not match"))
    local T = T1 <: T2 ? T2 : T1
    local v=zeros(T,length(A))
    for i=1:length(A)
        v[i]=A[i]⊗B[i]
    end
    ⊕(v...)
end

function ⊗(A::Array{T1,2},B::Array{T2,2}) where T1 <: Real where T2 <: Real
    size(A)==size(B) || throw(ArgumentError("The matrices must be the same size."))
    local T = T1 <: T2 ? T2 : T1
    local C = zeros(T,size(A))
    for i=1:size(A,1) 
        for j=1:size(B,2)
            C[i,j]=A[i,:]⊗B[:,j]
        end
    end
    C
end

function trop_pow(A::Array{T,2},n::Integer) where T<: Real
    size(A,1)==size(A,2) || throw(ArgumentError("The matrix must be square to raise it to a power."))
    n>0 || throw(ArgumentError("you can only raise it to a positive power"))
    B=copy(A)
    for i=2:n
       B=B⊗A
    end
    B
end

end