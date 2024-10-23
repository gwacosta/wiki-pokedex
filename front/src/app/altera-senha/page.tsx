'use client'

import { useForm } from "react-hook-form";
import { toast } from "sonner";
import { useRouter } from "next/navigation";

type Inputs = {
    novaSenha: string,
    confirmarSenha: string
}

function validaSenha(senha: string): string[] {
    const mensa: string[] = [];

    if (senha.length < 8) {
        mensa.push("A senha deve ter no mínimo 8 caracteres.");
    }

    let pequenas = 0;
    let grandes = 0;
    let numeros = 0;
    let simbolos = 0;

    for (const letra of senha) {
        if ((/[a-z]/).test(letra)) {
            pequenas++;
        } else if ((/[A-Z]/).test(letra)) {
            grandes++;
        } else if ((/[0-9]/).test(letra)) {
            numeros++;
        } else {
            simbolos++;
        }
    }

    if (pequenas === 0 || grandes === 0 || numeros === 0 || simbolos === 0) {
        mensa.push("A senha deve conter letras minúsculas, maiúsculas, números e símbolos.");
    }

    return mensa;
}

export default function AlterarSenha() {
    const { register, handleSubmit } = useForm<Inputs>();
    const router = useRouter();

    async function alteraSenha(data: Inputs) {
        const email = localStorage.getItem("email_recuperacao");
        if (!email) {
            toast.error("Erro ao recuperar o e-mail");
            router.push("/recupera-senha")
            return;
        }

        const erros = validaSenha(data.novaSenha);
        if (erros.length > 0) {
            toast.error(erros.join(" "));
            return;
        }

        if (data.novaSenha !== data.confirmarSenha) {
            toast.error("As senhas não coincidem!");
            return;
        }

        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/treinadores/alterar-senha`, {
            method: 'PATCH',
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ email, novaSenha: data.novaSenha })
        });

        if (response.status === 200) {
            toast.success("Senha alterada com sucesso!");
            localStorage.removeItem("email_recuperacao");
            router.push("/login");
        } else {
            const erro = await response.json();
            if (erro.erro === "A nova senha não pode ser igual à senha antiga") {
                toast.warning("A nova senha não pode ser igual à senha antiga");
            } else {
                toast.error("Erro ao alterar senha!");
            }
        }
    }

    return (
        <section className="bg-white dark:bg-white">
            <div className="flex flex-col items-center px-6 py-8 mx-auto md:h-screen lg:py-0">
                <div className="w-full bg-white border border-gray-400 rounded-lg shadow dark:border md:mt-20 sm:max-w-md xl:p-0 dark:bg-gray-800 dark:border-gray-700">
                    <div className="p-6 space-y-4 md:space-y-6 sm:p-8">
                        <h1 className="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                            Informe a Nova Senha
                        </h1>
                        <form className="space-y-4 md:space-y-6" onSubmit={handleSubmit(alteraSenha)}>
                            <div>
                                <label htmlFor="password" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                                    Nova Senha:
                                </label>
                                <input
                                    type="password"
                                    id="novaSenha"
                                    placeholder="••••••••"
                                    className="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    {...register("novaSenha")}
                                    required
                                />
                            </div>
                            <div>
                                <label htmlFor="password" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                                    Repita a Nova Senha:
                                </label>
                                <input
                                    type="password"
                                    id="confirmarSenha"
                                    placeholder="••••••••"
                                    className="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    {...register("confirmarSenha")}
                                    required
                                />
                            </div>
                            <button type="submit" className="w-full text-white bg-orange-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                                Alterar Senha
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    );
}