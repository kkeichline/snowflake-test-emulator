from fastapi import FastAPI

def create_app():
    app = FastAPI()

    # Database setup would go here

    from . import routes
    app.include_router(routes.router)

    return app