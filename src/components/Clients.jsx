import { useEffect, useState } from "react";
import { getCustomers } from "../services/getCustomers";

export const Clients = ({clientSelected}) => {
  const [clients, setClients] = useState([]);

  useEffect(() => {
    const fetchClients = async () => {
      try {
        const clients = await getCustomers();
        setClients(clients);
      } catch (error) {
        console.error("Error al buscar clientes:", error);
      }
    };

    fetchClients();
  }, [])
  
  const handleClientChange = (e) => {
    const selectedClient = JSON.parse(e.target.value);
    clientSelected(selectedClient)
  };

  return (
    <div className='w-full my-4 px-8'>
      <h2 className='w-full text-2xl font-archivo font-bold text-white text-center'>Cliente</h2>
      <select 
        className='bg-slate-700 mt-2 text-white font-roboto cursor-pointer rounded-md p-2 min-w-[16rem]'
        onChange={handleClientChange}
        >
        <option value=''>Selecciona un cliente</option>
        { clients.map((client) => (
          <option key={client.id} value={JSON.stringify(client)}>
            {client.firstName} {client.lastName}
          </option>
        ))
        }
      </select>
    </div>
  )
}
