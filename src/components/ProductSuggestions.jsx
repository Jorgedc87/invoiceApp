import AutoStoriesIcon from '@mui/icons-material/AutoStories';

const ProductSuggestions = ({ productSuggestions, handleAddProduct }) => {
  return (
    <div className='absolute flex flex-col inset-x-0 w-full bg-[#ffffffe7] text-black font-roboto rounded-b-md shadow-md justify-start'>
      {productSuggestions.map((product) => (
        <div
          key={product.id}
          className="flex flex-grow-1 items-center h-12 hover:bg-slate-300 px-2 cursor-pointer gap-4"
          onClick={() => handleAddProduct(product)}
        >
          <AutoStoriesIcon fontSize="small"/>
          <p className="flex-grow">{product.title}</p>
          <p>U${product.price}</p>
        </div>
      ))}
    </div>
  );
};

export default ProductSuggestions;
