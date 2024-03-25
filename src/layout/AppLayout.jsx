import React from 'react';

const AppLayout = ({ children }) => {
  return (
    <div className='min-h-screen bg-gradient-to-b from-[#133583]  to-[#161383] '>
      <header className=''>
        <h1 className='flex justify-center items-center font-bold text-3xl font-archivo bg-slate-900 text-white h-14 shadow-xl'>Invoice App</h1>
      </header>
      <main>
        {children}
      </main>
      <footer className='flex justify-center items-center h-8 bg-green-600 w-full fixed bottom-0 '>
        <h3 className='text-sm font-archivo'><span className='font-bold'>Jorge Calderón</span>. 2024</h3>
      </footer>
    </div>
  );
};

export default AppLayout;
