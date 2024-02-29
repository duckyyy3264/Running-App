from rest_framework import serializers

from activity.models import Club
from account.serializers import UserSerializer

class ClubSerializer(serializers.ModelSerializer):
    class Meta:
        model = Club
        fields = (
            "id", 
            "name", 
            "avatar", 
            "sport_type", 
            "week_activities", 
            "number_of_participants"
        )
        extra_kwargs = {
            "id": {"read_only": True}
        }

class DetailClubSerializer(serializers.ModelSerializer):
    week_activites = serializers.SerializerMethodField()
    number_of_participants = serializers.SerializerMethodField()
    users = UserSerializer(many=True)

    def get_week_activites(self, instance):
        return instance.week_activities()
    
    def get_number_of_participants(self, instance):
        return instance.number_of_participants()
    
    class Meta:
        model = Club
        fields = "__all__"
        extra_kwargs = {
            "id": {"read_only": True}
        }
    
class CreateUpdateClubSerializer(serializers.ModelSerializer):
    class Meta:
        model = Club
        fields = "__all__"
        extra_kwargs = {
            "id": {"read_only": True},
        }

# class UpdateClubSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Club
#         fields = "__all__"
#         extra_kwargs = {
#             "id": {"read_only": True},
#             "user": {"read_only": True},
#         }