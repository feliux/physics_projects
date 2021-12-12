
include("rawImage.jl");
include("eVec.jl");
include("braPT.jl");
include("ketPT.jl");
include("partialTrace.jl");

key_ex5 = rand(0:1, 64, 64);
encryptedImage = rem.(rawImage + key_ex5, 2);
