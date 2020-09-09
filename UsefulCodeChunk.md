# Creating a model builder to facilitate development

```py
class ModelFactory:
"""Factory class to instantiate different models

    Everytime a new model is added to framework it is expected to update the `archs` dictionary

    Attributes:
        archs (dict): dictionary of model names and corresponding model classes.
    """
    archs = {'vnet': Vnet, 'vnet_transformer': Vnet_transformer}

    @staticmethod
    def getargs(arch):
        """Function to return the constructor arguments and their default values for a given model class.
        """
        Uses: inspect.getfullargspec(
            ModelFactory.archs[arch].__init__).args if arg != 'self']
        defaults = [
            default for defualt in inspect.getfullargspec(
                ModelFactory.archs[arch].__init__).defaults]

Building the model

ModelFactory.archs[opt.arch](**{arg: opt.__dict__[arg] for arg, _ in ModelFactory.getargs(opt.arch)})
```
