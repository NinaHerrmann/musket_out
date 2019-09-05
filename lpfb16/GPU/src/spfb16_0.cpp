	
	#include <omp.h>
	#include <openacc.h>
	#include <stdlib.h>
	#include <math.h>
	#include <array>
	#include <vector>
	#include <sstream>
	#include <chrono>
	#include <random>
	#include <limits>
	#include <memory>
	#include <cstddef>
	#include <type_traits>
	//#include <cuda.h>
	//#include <openacc_curand.h>
	
	#include "../include/musket.hpp"
	#include "../include/spfb16_0.hpp"
	
	
	
			
	const double PI = 3.141592653589793;
	mkt::DArray<float> input(0, 134232064, 134232064, 0.0f, 1, 0, 0, mkt::DIST, mkt::COPY);
	mkt::DArray<float> input_double(0, 134217728, 134217728, 0.0f, 1, 0, 0, mkt::DIST, mkt::COPY);
	mkt::DArray<float2> c_input_double(0, 134217728, 134217728, float2{}, 1, 0, 0, mkt::DIST, mkt::COPY);
	mkt::DArray<float2> c_output(0, 134217728, 134217728, float2{}, 1, 0, 0, mkt::DIST, mkt::COPY);
	mkt::DArray<float> coeff(0, 16384, 16384, 0.0f, 1, 0, 0, mkt::DIST, mkt::COPY);
	
	//Float2::Float2() : x(), y() {}
	

	
	struct FIR_map_index_in_place_array_functor{
		
		FIR_map_index_in_place_array_functor(const mkt::DArray<float>& _input, const mkt::DArray<float>& _coeff) : input(_input), coeff(_coeff){
		}
		
		~FIR_map_index_in_place_array_functor() {}
		
		auto operator()(int Index, float a){
			float newa = 0;
			
			if(((Index) <= ((channels) * (spectra)))){
			for(int j = 0; ((j) < (taps)); j++){
				newa += (// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
				 * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
				);
			}
			}
			return (newa);
		}
	
		void init(int gpu){
			input.init(gpu);
			coeff.init(gpu);
		}
		
		void set_id(int gang, int worker, int vector){
			_gang = gang;
			_worker = worker;
			_vector = vector;
		}
		
		int taps;
		int channels;
		int spectra;
		
		mkt::DeviceArray<float> input;
		mkt::DeviceArray<float> coeff;
		
		
		int _gang;
		int _worker;
		int _vector;
	};
	struct Float_to_float2_map_index_in_place_array_functor{
		
		Float_to_float2_map_index_in_place_array_functor(const mkt::DArray<float>& _input_double) : input_double(_input_double){
		}
		
		~Float_to_float2_map_index_in_place_array_functor() {}
		
		auto operator()(int x, float2 y){
			y.x = static_cast<float>(// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			);
			y.y = 0.0f;
			return (y);
		}
	
		void init(int gpu){
			input_double.init(gpu);
		}
		
		void set_id(int gang, int worker, int vector){
			_gang = gang;
			_worker = worker;
			_vector = vector;
		}
		
		
		mkt::DeviceArray<float> input_double;
		
		
		int _gang;
		int _worker;
		int _vector;
	};
	struct Fetch_map_index_in_place_array_functor{
		
		Fetch_map_index_in_place_array_functor(const mkt::DArray<float2>& _c_output) : c_output(_c_output){
		}
		
		~Fetch_map_index_in_place_array_functor() {}
		
		auto operator()(int i, float2 Ti){
			return // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			;
		}
	
		void init(int gpu){
			c_output.init(gpu);
		}
		
		void set_id(int gang, int worker, int vector){
			_gang = gang;
			_worker = worker;
			_vector = vector;
		}
		
		int counter;
		int log2size;
		
		mkt::DeviceArray<float2> c_output;
		
		
		int _gang;
		int _worker;
		int _vector;
	};
	struct Combine_map_index_in_place_array_functor{
		
		Combine_map_index_in_place_array_functor(const mkt::DArray<float2>& _c_input_double) : c_input_double(_c_input_double){
		}
		
		~Combine_map_index_in_place_array_functor() {}
		
		auto operator()(int Index, float2 Ai){
			float2 newa;
			newa.x = 0.0f;
			newa.y = 0.0f;
			int b = ((Index) / std::pow(2, (((log2size) - 1) - (counter))));
			int b2 = 0;
			for(int l = 0; ((l) <= (counter)); l++){
				
				if(((b) == 1)){
				b2 = ((2 * (b2)) + 1);
				}
				 else {
						b2 = (2 * (b2));
					}
				b = ((b) / 2);
			}
			float temp = (((2.0 * (pi)) / (Problemsize)) * ((b2) * std::pow(2, (((log2size) - 1) - (counter)))));
			float2 intermediateresult;
			intermediateresult.x = 6363;
			intermediateresult.y = 3636;
			
			if(((Index) == std::pow(2, (((log2size) - 1) - (counter))))){
			float2 mult_res;
			mult_res.x = (((intermediateresult).x * (Ai).x) - ((intermediateresult).y * (Ai).y));
			mult_res.y = (((intermediateresult).x * (Ai).y) + ((intermediateresult).y * (Ai).x));
			float2 add_res;
			add_res.x = (// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			 + (mult_res).x);
			add_res.y = (// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			 + (mult_res).y);
			newa = (add_res);
			}
			 else {
					float2 mult_res2;
					mult_res2.x = (((intermediateresult).x * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					) - ((intermediateresult).y * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					));
					mult_res2.y = (((intermediateresult).x * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					) + ((intermediateresult).y * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					));
					float2 add_res2;
					add_res2.x = ((Ai).x + (mult_res2).x);
					add_res2.y = ((Ai).y + (mult_res2).y);
					newa = (add_res2);
				}
			return (newa);
		}
	
		void init(int gpu){
			c_input_double.init(gpu);
		}
		
		void set_id(int gang, int worker, int vector){
			_gang = gang;
			_worker = worker;
			_vector = vector;
		}
		
		int counter;
		int log2size;
		double pi;
		int Problemsize;
		
		mkt::DeviceArray<float2> c_input_double;
		
		
		int _gang;
		int _worker;
		int _vector;
	};
	
	
	
	
	
	
	
	int main(int argc, char** argv) {
		
		
		
		FIR_map_index_in_place_array_functor fIR_map_index_in_place_array_functor{input, coeff};
		Float_to_float2_map_index_in_place_array_functor float_to_float2_map_index_in_place_array_functor{input_double};
		Fetch_map_index_in_place_array_functor fetch_map_index_in_place_array_functor{c_output};
		Combine_map_index_in_place_array_functor combine_map_index_in_place_array_functor{c_input_double};
		
		
				
		
		int ntaps = 32;
		int nchans = 16;
		int nspectra = 8389151;
		int log2size = 4;
		fIR_map_index_in_place_array_functor.taps = (ntaps);fIR_map_index_in_place_array_functor.channels = (nchans);fIR_map_index_in_place_array_functor.spectra = (nspectra);
		mkt::map_index_in_place<float, FIR_map_index_in_place_array_functor>(input_double, fIR_map_index_in_place_array_functor);
		mkt::map_index_in_place<float2, Float_to_float2_map_index_in_place_array_functor>(c_output, float_to_float2_map_index_in_place_array_functor);
		for(int j = 0; ((j) < (log2size)); j++){
			fetch_map_index_in_place_array_functor.counter = (j);fetch_map_index_in_place_array_functor.log2size = (log2size);
			mkt::map_index_in_place<float2, Fetch_map_index_in_place_array_functor>(c_input_double, fetch_map_index_in_place_array_functor);
			combine_map_index_in_place_array_functor.counter = (j);combine_map_index_in_place_array_functor.log2size = (log2size);combine_map_index_in_place_array_functor.pi = (PI);combine_map_index_in_place_array_functor.Problemsize = 16;
			mkt::map_index_in_place<float2, Combine_map_index_in_place_array_functor>(c_output, combine_map_index_in_place_array_functor);
		}
		
		printf("Threads: %i\n", 0);
		printf("Processes: %i\n", 1);
		
		return EXIT_SUCCESS;
		}
