	#include <cuda.h>
	#include <omp.h>
	#include <stdlib.h>
	#include <math.h>
	#include <array>
	#include <vector>
	#include <sstream>
	#include <chrono>
	#include <curand_kernel.h>
	#include <limits>
	#include <memory>
	#include <cstddef>
	#include <type_traits>
	//#include <../include/filehelper.h>
	#include <../include/timer.cuh>
	
	#include "../include/musket.cuh"
	#include "../include/spfb2048_0.cuh"
	
	
	
	const double PI = 3.141592653589793;
	
	//Float2::Float2() : x(), y() {}
	

	
	struct FIR_map_index_in_place_array_functor{
		
		FIR_map_index_in_place_array_functor(const mkt::DArray<float>& _input, const mkt::DArray<float>& _coeff) : input(_input), coeff(_coeff){}
		
		~FIR_map_index_in_place_array_functor() {}
		
		__device__
		auto operator()(int Index, float a){
			float newa = 0.0;
			
			if((Index + ((taps-1) *channels)) <= ((channels) * (spectra))){
			for(int j = 0; ((j) < (taps)); j++){
	//		if (Index > 16384 && Index < 16386) {
	//		printf("Index: %d j:%d coeffindex %d data is %f coeff is %f \n", Index, j, (Index%channels)+(j*channels), input.get_data_local(((Index) + ((j) * (channels)))), coeff.get_data_local(((Index%(channels)) + ((j) * (channels)))));
//}		
		newa += (input.get_data_local(((Index) + ((j) * (channels)))) * coeff.get_data_local(((Index%(channels*taps)) + ((j) * (channels))))
				);
			}
			}
	//		if (Index == 16385) printf("%f", newa);			
return newa;
		}
	
		void init(int device){
			input.init(device);
			coeff.init(device);
		}
		
		size_t get_smem_bytes(){
			size_t result = 0;
			return result;
		}
		
		int taps;
		int channels;
		int spectra;
		
		mkt::DeviceArray<float> input;
		mkt::DeviceArray<float> coeff;
	};
	struct Float_to_float2_map_index_in_place_array_functor{
		
		Float_to_float2_map_index_in_place_array_functor(const mkt::DArray<float>& _input_double) : input_double(_input_double){}
		
		~Float_to_float2_map_index_in_place_array_functor() {}
		
		__device__
		auto operator()(int x, float2 y){
			y.x = static_cast<float>(// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			input_double.get_data_local((x))
			);
			y.y = 0.0f;
			return (y);
		}
	
		void init(int device){
			input_double.init(device);
		}
		
		size_t get_smem_bytes(){
			size_t result = 0;
			return result;
		}
		
		
		mkt::DeviceArray<float> input_double;
	};
	struct Fetch_map_index_in_place_array_functor{
		
		Fetch_map_index_in_place_array_functor(const mkt::DArray<float2>& _c_output) : c_output(_c_output){}
		
		~Fetch_map_index_in_place_array_functor() {}
		
		__device__
		auto operator()(int i, float2 Ti){
			return // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			c_output.get_data_local((i  ^ (int) __powf(2, (((log2size) - 1) - (counter)))))
			;
		}
	
		void init(int device){
			c_output.init(device);
		}
		
		size_t get_smem_bytes(){
			size_t result = 0;
			return result;
		}
		
		int counter;
		int log2size;
		
		mkt::DeviceArray<float2> c_output;
	};
	struct Combine_map_index_in_place_array_functor{
		
		Combine_map_index_in_place_array_functor(const mkt::DArray<float2>& _c_input_double) : c_input_double(_c_input_double){}
		
		~Combine_map_index_in_place_array_functor() {}
		
		__device__
		auto operator()(int Index, float2 Ai){
			float2 newa;
			newa.x = 0.0f;
			newa.y = 0.0f;
			int b = Index >> (log2size - counter - 1);
			int b2 = 0;

			for(int l = 0;l <= counter;l++) {
				b2 = (b & 1) ? 2 * b2 + 1 : 2 * b2;
				b >>= 1;
			}

			double temp = 2.0 * pi / Problemsize * (b2 << (log2size - counter - 1));
		float2 intermediateresult;
			intermediateresult.x = __cosf(temp);
			intermediateresult.y = -__sinf(temp);
			
			if(((Index) == __powf(2, (((log2size) - 1) - (counter))))){
			float2 mult_res;
			mult_res.x = (((intermediateresult).x * (Ai).x) - ((intermediateresult).y * (Ai).y));
			mult_res.y = (((intermediateresult).x * (Ai).y) + ((intermediateresult).y * (Ai).x));
			float2 add_res;
			add_res.x = (// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			c_input_double.get_data_local((Index)).x
			 + (mult_res).x);
			add_res.y = (// TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
			c_input_double.get_data_local((Index)).y
			 + (mult_res).y);
			newa = (add_res);
			}
			 else {
					float2 mult_res2;
					mult_res2.x = (((intermediateresult).x * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					c_input_double.get_data_local((Index)).x
					) - ((intermediateresult).y * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					c_input_double.get_data_local((Index)).y
					));
					mult_res2.y = (((intermediateresult).x * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					c_input_double.get_data_local((Index)).y
					) + ((intermediateresult).y * // TODO: ExpressionGenerator.generateCollectionElementRef: Array, global indices, distributed
					c_input_double.get_data_local((Index)).x
					));
					float2 add_res2;
					add_res2.x = ((Ai).x + (mult_res2).x);
					add_res2.y = ((Ai).y + (mult_res2).y);
					newa = (add_res2);
				}
			return (newa);
		}
	
		void init(int device){
			c_input_double.init(device);
		}
		
		size_t get_smem_bytes(){
			size_t result = 0;
			return result;
		}
		
		int counter;
		int log2size;
		double pi;
		int Problemsize;
		
		mkt::DeviceArray<float2> c_input_double;
	};
	
	
	
	
	
	
	
	int main(int argc, char** argv) {
		mkt::init();
		
		
		mkt::sync_streams();
		std::chrono::high_resolution_clock::time_point complete_timer_start = std::chrono::high_resolution_clock::now();
		GpuTimer timer;
		double allocation = 0.0,fill = 0.0, rest = 0.0, rest2 = 0.0;
		timer.Start();
		mkt::DArray<float> input(0, 268449792, 268449792, 0.0f, 1, 0, 0, mkt::DIST, mkt::COPY);
                mkt::DArray<float> input_double(0, 268435456, 268435456, 0.0f, 1, 0, 0, mkt::DIST, mkt::COPY);
                mkt::DArray<float2> c_input_double(0, 268435456, 268435456, float2{}, 1, 0, 0, mkt::DIST, mkt::COPY);
                mkt::DArray<float2> c_output(0, 268435456, 268435456, float2{}, 1, 0, 0, mkt::DIST, mkt::COPY);
                mkt::DArray<float> coeff(0, 16384, 16384, 0.0f, 1, 0, 0, mkt::DIST, mkt::COPY);
		srand(1);
		timer.Stop();
		allocation += timer.Elapsed();
		timer.Start();
		for (int n = 0; n < 268449792; n++) {
			input[n] = 1;
		}
		for (int n = 0; n < 16384; n++) {
			coeff[n] = 1;//(rand() / (float)RAND_MAX);
		}
		input.update_devices();
		coeff.update_devices();
		timer.Stop();
		fill += timer.Elapsed();
		timer.Start();
		FIR_map_index_in_place_array_functor fIR_map_index_in_place_array_functor{input, coeff};
		Float_to_float2_map_index_in_place_array_functor float_to_float2_map_index_in_place_array_functor{input_double};
		Fetch_map_index_in_place_array_functor fetch_map_index_in_place_array_functor{c_output};
		Combine_map_index_in_place_array_functor combine_map_index_in_place_array_functor{c_input_double};
		timer.Stop();
		rest += timer.Elapsed();
		
		double fir_time = 0.0, fft_time = 0.0, R2C_time = 0.0;

		int ntaps = 8;
		int nchans = 2048;
		int nspectra = 131072;
		int log2size = 11;
		timer.Start();

		fIR_map_index_in_place_array_functor.taps = (ntaps);fIR_map_index_in_place_array_functor.channels = (nchans);fIR_map_index_in_place_array_functor.spectra = (nspectra);	
		mkt::map_index_in_place<float, FIR_map_index_in_place_array_functor>(input_double, fIR_map_index_in_place_array_functor);
		timer.Stop();
		cudaDeviceSynchronize();
		input_double.update_self();
		for (int i = 134210000; i < 134210010; i++){
			//printf("%f", input_double[i]);
}
		fir_time += timer.Elapsed();
		timer.Start();	
		mkt::map_index_in_place<float2, Float_to_float2_map_index_in_place_array_functor>(c_output, float_to_float2_map_index_in_place_array_functor);
		timer.Stop();
		R2C_time += timer.Elapsed();
		timer.Start();	
		for(int j = 0; ((j) < (log2size)); j++){
			fetch_map_index_in_place_array_functor.counter = (j);fetch_map_index_in_place_array_functor.log2size = (log2size);
			mkt::map_index_in_place<float2, Fetch_map_index_in_place_array_functor>(c_input_double, fetch_map_index_in_place_array_functor);
			combine_map_index_in_place_array_functor.counter = (j);combine_map_index_in_place_array_functor.log2size = (log2size);combine_map_index_in_place_array_functor.pi = (PI);combine_map_index_in_place_array_functor.Problemsize = 16;
			mkt::map_index_in_place<float2, Combine_map_index_in_place_array_functor>(c_output, combine_map_index_in_place_array_functor);
		}
		cudaDeviceSynchronize();
		timer.Stop();
		fft_time += timer.Elapsed();
		cudaDeviceSynchronize();
		c_output.update_self();
		for(int i = 0; i <10 ; i++){
			//printf("(%f%f)\n", c_output[i].x, c_output[i].y);
			
		}
		printf("\n%.5f;%.5f;%.5f;%f;%f;%f\n", fir_time, fft_time, R2C_time, allocation, fill, rest);
		
		return EXIT_SUCCESS;
		}