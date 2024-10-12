'use client'

import { useForm } from "react-hook-form";
import { toast } from "sonner";
import { useRouter } from "next/navigation";
import { ChangeEvent, FormEvent } from "react";

type Inputs = {
    codigo: string
}

export default function VerificarCodigo() {
    const { register, handleSubmit } = useForm<Inputs>();
    const router = useRouter();

    async function verificaCodigo(data: Inputs) {
        const email = localStorage.getItem("email_recuperacao");
        if (!email) {
            toast.error("Erro ao recuperar o e-mail");
            router.push("/recupera-senha")
            return;
        }

        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/treinadores/verificar-codigo`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ email, codigo: data.codigo })
        });

        if (response.status === 200) {
            toast.success("Código verificado!");
            router.push("/altera-senha");
        } else {
            toast.error("Código incorreto!");
        }
    }

    async function reenviarCodigo() {
        const email = localStorage.getItem("email_recuperacao");
        if (!email) {
            toast.error("Erro ao recuperar o e-mail");
            router.push("/recupera-senha")
            return;
        }

        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/treinadores/recuperar-senha`, {
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ email })
        });

        if (response.status === 200) {
            toast.success("Novo código enviado!");
        } else {
            toast.error("Erro ao reenviar o código!");
            router.push("/recupera-senha")
        }
    }

    const handleNumberInput = (e: ChangeEvent<HTMLInputElement>): void => {
        const inputValue = e.target.value.replace(/\D/g, '');

        e.target.value = inputValue;
    };

    return (
        <section className="bg-white dark:bg-white">
            <div className="flex flex-col items-center px-6 py-8 mx-auto md:h-screen lg:py-0">
                <div className="w-full bg-white border border-gray-400 rounded-lg shadow dark:border md:mt-20 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                    <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
                        <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                            Informe o código enviado para o seu E-mail
                        </h1>
                        <form className="space-y-4 md:space-y-6" onSubmit={handleSubmit(verificaCodigo)}>
                            <div>
                                <label htmlFor="codigo" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                                    Código:
                                </label>
                                <input
                                    type="text"
                                    id="codigo"
                                    className="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="123456"
                                    onInput={handleNumberInput}
                                    maxLength={6}
                                    {...register("codigo")}
                                    required
                                />
                            </div>
                            <button type="submit" className="w-full text-white bg-orange-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                Verificar
                            </button>
                            <p className="text-sm font-medium text-end text-primary-600 hover:underline cursor-pointer dark:text-white" onClick={reenviarCodigo}>
                                Reenviar Código
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    );
}