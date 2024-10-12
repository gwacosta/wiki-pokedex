'use client'

import { useForm } from "react-hook-form";
import { toast } from "sonner";
import { useRouter } from "next/navigation";

type Inputs = {
    email: string
}

export default function SolicitarRecuperacao() {
    const { register, handleSubmit } = useForm<Inputs>();
    const router = useRouter();

    async function verificaEmail(data: Inputs) {
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/treinadores/gera-codigo`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ email: data.email })
        });

        if (response.status === 200) {
            localStorage.setItem("email_recuperacao", data.email);
            toast.success("Código enviado para o seu e-mail!");
            router.push("/verifica-codigo");
        } else {
            toast.error("E-mail não encontrado!");
        }
    }

    return (
        <section className="bg-white dark:bg-white">
            <div className="flex flex-col items-center px-6 py-8 mx-auto md:h-screen lg:py-0">
                <div className="w-full bg-white border border-gray-400 rounded-lg shadow dark:border md:mt-20 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                    <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
                        <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                            Informe seu E-mail
                        </h1>
                        <form className="space-y-4 md:space-y-6" onSubmit={handleSubmit(verificaEmail)}>
                            <div>
                                <label htmlFor="email" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                                    E-mail:
                                </label>
                                <input
                                    type="email"
                                    id="email"
                                    className="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="name@company.com"
                                    required
                                    {...register("email")}
                                />
                            </div>
                            <button type="submit" className="w-full text-white bg-orange-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                Enviar Código
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    );
}