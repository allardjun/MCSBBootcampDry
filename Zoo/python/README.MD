# Files and strings with Python and Jupyter

## Things to do beforehand

### Mandatory
1. Install Anaconda from [here](https://www.anaconda.com/distribution/#download-section). Choose the Python 3 version for your operating system.
   1. Don't add to path if you on macOS/Linux.
   2. Windows you could add to path provided you don't have alternate versions of python installed (like another Anaconda, miniconda, IDLE etc).
2. Anaconda comes with a virtual environment called `base`. See if this is working by opening `Anaconda Prompt` (installed along with Anaconda)
   1. If it says `(base)` before the prompt, (for example, mine says `(base) C:\Users\sriki>`), then we are good.
   2. If it does not, try running `conda activate base` or `activate base`.
   3. If both don't work, reach out!
3. In the Anaconda prompt, navigate to the Python module folder under `Zoo/python` and run 
   
    ```sh
    python test.py
    ``` 
    in this folder. You should get `Matplotlib imported. Success!`
    1. If you get `ModuleNotFoundError: No module named 'matplotlib'`, then try install `matplotlib` in the Anaconda prompt with 
    ```
    pip install matplotlib
    ```
    If it does not succeed, reach out!
4. In the Anaconda prompt, test if the command `jupyter notebook` works. You should get something that opens in a browser that looks like:
![Jupyter notebook](imgs/notebook_start.PNG "Jupyter notebook")
If you don't get this, reach out!

### Optional
1. Create a virtual environment with 
   ```{sh}
   conda create --name myenv
   ```
   You can name your environment whatever you want by using some other name instead of `myenv`.
2. Activate the virtual environment with 
   ```sh
   conda activate myenv
   ```
3. Install `matplotlib` with
   ```sh
   pip install matplotlib
   ```
   or 
   ```sh
   conda install matplotlib
   ```
4. Make Jupyter notebook use your virtual environment with 
   ```sh
   pip install --user ipykernel
   python -m ipykernel install --user --name=myenv_kernel
   ```
   Here `myenv_kernel` is the name of you kernel.
If any of the optional steps don't work, reach out!